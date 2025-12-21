(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v4)
             (pred_8 ?v1 ?v2)
             (pred_11 ?v13 ?v2)
             (pred_4 ?v11 ?v13 )
	     (pred_6 ?v13)
             (pred_12 ?v5)
             (pred_1 ?v1)
             (pred_2 ?v2)
             (pred_10 ?v13)
             (pred_9 ?v1)
             (pred_5 ?v13)
             (pred_3 ))



(:action op_4
:parameters (?v3 ?v6 ?v9 ?v8)
:precondition (and (pred_12 ?v3) (pred_12 ?v6) (pred_1 ?v9) (pred_2 ?v8)
          (pred_7 ?v3 ?v6) (pred_8 ?v9 ?v8)
                   (pred_11 ?v6 ?v8) (pred_6 ?v3) 
                   (pred_10 ?v6) (pred_9 ?v9))
:effect (and  (pred_5 ?v6) (not (pred_10 ?v6))))


(:action op_2
:parameters (?v3 ?v10)
:precondition (and (pred_12 ?v3) (pred_12 ?v10)
               (pred_6 ?v3) (pred_7 ?v3 ?v10) (pred_5 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v3))))

(:action op_5
:parameters (?v3 ?v9)
:precondition (and (pred_12 ?v3) (pred_1 ?v9) 
                  (pred_6 ?v3) (pred_4 ?v9 ?v3) (pred_3 ))
:effect (and (pred_9 ?v9)
   (not (pred_4 ?v9 ?v3)) (not (pred_3 ))))


(:action op_1
:parameters (?v3 ?v12 ?v7)
:precondition (and (pred_12 ?v3) (pred_1 ?v12) (pred_1 ?v7)
                  (pred_6 ?v3) (pred_9 ?v7) (pred_4 ?v12 ?v3))
:effect (and (pred_9 ?v12) (pred_4 ?v7 ?v3)
        (not (pred_9 ?v7)) (not (pred_4 ?v12 ?v3))))

(:action op_3
:parameters (?v3 ?v9)
:precondition (and (pred_12 ?v3) (pred_1 ?v9) 
                  (pred_6 ?v3) (pred_9 ?v9))
:effect (and (pred_3 ) (pred_4 ?v9 ?v3) (not (pred_9 ?v9)))))


	
