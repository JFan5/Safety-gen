(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v7)
             (pred_4 ?v5 ?v8)
             (pred_7 ?v10 ?v8)
             (pred_1 ?v4 ?v10 )
	     (pred_12 ?v10)
             (pred_2 ?v3)
             (pred_5 ?v5)
             (pred_8 ?v8)
             (pred_10 ?v10)
             (pred_9 ?v5)
             (pred_6 ?v10)
             (pred_11 ))



(:action op_3
:parameters (?v6 ?v12 ?v11 ?v1)
:precondition (and (pred_2 ?v6) (pred_2 ?v12) (pred_5 ?v11) (pred_8 ?v1)
          (pred_3 ?v6 ?v12) (pred_4 ?v11 ?v1)
                   (pred_7 ?v12 ?v1) (pred_12 ?v6) 
                   (pred_10 ?v12) (pred_9 ?v11))
:effect (and  (pred_6 ?v12) (not (pred_10 ?v12))))


(:action op_5
:parameters (?v6 ?v9)
:precondition (and (pred_2 ?v6) (pred_2 ?v9)
               (pred_12 ?v6) (pred_3 ?v6 ?v9) (pred_6 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_2 ?v6) (pred_5 ?v11) 
                  (pred_12 ?v6) (pred_1 ?v11 ?v6) (pred_11 ))
:effect (and (pred_9 ?v11)
   (not (pred_1 ?v11 ?v6)) (not (pred_11 ))))


(:action op_4
:parameters (?v6 ?v13 ?v2)
:precondition (and (pred_2 ?v6) (pred_5 ?v13) (pred_5 ?v2)
                  (pred_12 ?v6) (pred_9 ?v2) (pred_1 ?v13 ?v6))
:effect (and (pred_9 ?v13) (pred_1 ?v2 ?v6)
        (not (pred_9 ?v2)) (not (pred_1 ?v13 ?v6))))

(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_2 ?v6) (pred_5 ?v11) 
                  (pred_12 ?v6) (pred_9 ?v11))
:effect (and (pred_11 ) (pred_1 ?v11 ?v6) (not (pred_9 ?v11)))))


	
