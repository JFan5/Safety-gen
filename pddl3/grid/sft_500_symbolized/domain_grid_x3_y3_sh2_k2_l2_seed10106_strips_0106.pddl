(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v3)
             (pred_4 ?v11 ?v5)
             (pred_5 ?v12 ?v5)
             (pred_2 ?v8 ?v12 )
	     (pred_9 ?v12)
             (pred_3 ?v2)
             (pred_6 ?v11)
             (pred_8 ?v5)
             (pred_10 ?v12)
             (pred_12 ?v11)
             (pred_11 ?v12)
             (pred_7 ))



(:action op_1
:parameters (?v4 ?v6 ?v10 ?v7)
:precondition (and (pred_3 ?v4) (pred_3 ?v6) (pred_6 ?v10) (pred_8 ?v7)
          (pred_1 ?v4 ?v6) (pred_4 ?v10 ?v7)
                   (pred_5 ?v6 ?v7) (pred_9 ?v4) 
                   (pred_10 ?v6) (pred_12 ?v10))
:effect (and  (pred_11 ?v6) (not (pred_10 ?v6))))


(:action op_5
:parameters (?v4 ?v9)
:precondition (and (pred_3 ?v4) (pred_3 ?v9)
               (pred_9 ?v4) (pred_1 ?v4 ?v9) (pred_11 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v4))))

(:action op_3
:parameters (?v4 ?v10)
:precondition (and (pred_3 ?v4) (pred_6 ?v10) 
                  (pred_9 ?v4) (pred_2 ?v10 ?v4) (pred_7 ))
:effect (and (pred_12 ?v10)
   (not (pred_2 ?v10 ?v4)) (not (pred_7 ))))


(:action op_4
:parameters (?v4 ?v13 ?v1)
:precondition (and (pred_3 ?v4) (pred_6 ?v13) (pred_6 ?v1)
                  (pred_9 ?v4) (pred_12 ?v1) (pred_2 ?v13 ?v4))
:effect (and (pred_12 ?v13) (pred_2 ?v1 ?v4)
        (not (pred_12 ?v1)) (not (pred_2 ?v13 ?v4))))

(:action op_2
:parameters (?v4 ?v10)
:precondition (and (pred_3 ?v4) (pred_6 ?v10) 
                  (pred_9 ?v4) (pred_12 ?v10))
:effect (and (pred_7 ) (pred_2 ?v10 ?v4) (not (pred_12 ?v10)))))


	
