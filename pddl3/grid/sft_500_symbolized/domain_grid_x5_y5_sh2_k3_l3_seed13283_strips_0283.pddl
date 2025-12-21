(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v5)
             (pred_1 ?v7 ?v2)
             (pred_7 ?v3 ?v2)
             (pred_6 ?v9 ?v3 )
	     (pred_12 ?v3)
             (pred_8 ?v10)
             (pred_11 ?v7)
             (pred_3 ?v2)
             (pred_4 ?v3)
             (pred_9 ?v7)
             (pred_2 ?v3)
             (pred_10 ))



(:action op_2
:parameters (?v6 ?v12 ?v13 ?v4)
:precondition (and (pred_8 ?v6) (pred_8 ?v12) (pred_11 ?v13) (pred_3 ?v4)
          (pred_5 ?v6 ?v12) (pred_1 ?v13 ?v4)
                   (pred_7 ?v12 ?v4) (pred_12 ?v6) 
                   (pred_4 ?v12) (pred_9 ?v13))
:effect (and  (pred_2 ?v12) (not (pred_4 ?v12))))


(:action op_4
:parameters (?v6 ?v1)
:precondition (and (pred_8 ?v6) (pred_8 ?v1)
               (pred_12 ?v6) (pred_5 ?v6 ?v1) (pred_2 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v6))))

(:action op_3
:parameters (?v6 ?v13)
:precondition (and (pred_8 ?v6) (pred_11 ?v13) 
                  (pred_12 ?v6) (pred_6 ?v13 ?v6) (pred_10 ))
:effect (and (pred_9 ?v13)
   (not (pred_6 ?v13 ?v6)) (not (pred_10 ))))


(:action op_5
:parameters (?v6 ?v11 ?v8)
:precondition (and (pred_8 ?v6) (pred_11 ?v11) (pred_11 ?v8)
                  (pred_12 ?v6) (pred_9 ?v8) (pred_6 ?v11 ?v6))
:effect (and (pred_9 ?v11) (pred_6 ?v8 ?v6)
        (not (pred_9 ?v8)) (not (pred_6 ?v11 ?v6))))

(:action op_1
:parameters (?v6 ?v13)
:precondition (and (pred_8 ?v6) (pred_11 ?v13) 
                  (pred_12 ?v6) (pred_9 ?v13))
:effect (and (pred_10 ) (pred_6 ?v13 ?v6) (not (pred_9 ?v13)))))


	
