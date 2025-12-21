(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v5)
             (pred_8 ?v9 ?v3)
             (pred_2 ?v4 ?v3)
             (pred_4 ?v11 ?v4 )
	     (pred_5 ?v4)
             (pred_6 ?v7)
             (pred_11 ?v9)
             (pred_9 ?v3)
             (pred_1 ?v4)
             (pred_7 ?v9)
             (pred_3 ?v4)
             (pred_12 ))



(:action op_1
:parameters (?v6 ?v12 ?v10 ?v8)
:precondition (and (pred_6 ?v6) (pred_6 ?v12) (pred_11 ?v10) (pred_9 ?v8)
          (pred_10 ?v6 ?v12) (pred_8 ?v10 ?v8)
                   (pred_2 ?v12 ?v8) (pred_5 ?v6) 
                   (pred_1 ?v12) (pred_7 ?v10))
:effect (and  (pred_3 ?v12) (not (pred_1 ?v12))))


(:action op_5
:parameters (?v6 ?v2)
:precondition (and (pred_6 ?v6) (pred_6 ?v2)
               (pred_5 ?v6) (pred_10 ?v6 ?v2) (pred_3 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_6 ?v6) (pred_11 ?v10) 
                  (pred_5 ?v6) (pred_4 ?v10 ?v6) (pred_12 ))
:effect (and (pred_7 ?v10)
   (not (pred_4 ?v10 ?v6)) (not (pred_12 ))))


(:action op_2
:parameters (?v6 ?v1 ?v13)
:precondition (and (pred_6 ?v6) (pred_11 ?v1) (pred_11 ?v13)
                  (pred_5 ?v6) (pred_7 ?v13) (pred_4 ?v1 ?v6))
:effect (and (pred_7 ?v1) (pred_4 ?v13 ?v6)
        (not (pred_7 ?v13)) (not (pred_4 ?v1 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_6 ?v6) (pred_11 ?v10) 
                  (pred_5 ?v6) (pred_7 ?v10))
:effect (and (pred_12 ) (pred_4 ?v10 ?v6) (not (pred_7 ?v10)))))


	
