(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v6)
             (pred_10 ?v8 ?v1)
             (pred_11 ?v10 ?v1)
             (pred_7 ?v12 ?v10 )
	     (pred_6 ?v10)
             (pred_2 ?v2)
             (pred_9 ?v8)
             (pred_1 ?v1)
             (pred_8 ?v10)
             (pred_4 ?v8)
             (pred_5 ?v10)
             (pred_3 ))



(:action op_1
:parameters (?v4 ?v7 ?v5 ?v11)
:precondition (and (pred_2 ?v4) (pred_2 ?v7) (pred_9 ?v5) (pred_1 ?v11)
          (pred_12 ?v4 ?v7) (pred_10 ?v5 ?v11)
                   (pred_11 ?v7 ?v11) (pred_6 ?v4) 
                   (pred_8 ?v7) (pred_4 ?v5))
:effect (and  (pred_5 ?v7) (not (pred_8 ?v7))))


(:action op_4
:parameters (?v4 ?v9)
:precondition (and (pred_2 ?v4) (pred_2 ?v9)
               (pred_6 ?v4) (pred_12 ?v4 ?v9) (pred_5 ?v9))
:effect (and (pred_6 ?v9) (not (pred_6 ?v4))))

(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_2 ?v4) (pred_9 ?v5) 
                  (pred_6 ?v4) (pred_7 ?v5 ?v4) (pred_3 ))
:effect (and (pred_4 ?v5)
   (not (pred_7 ?v5 ?v4)) (not (pred_3 ))))


(:action op_5
:parameters (?v4 ?v13 ?v3)
:precondition (and (pred_2 ?v4) (pred_9 ?v13) (pred_9 ?v3)
                  (pred_6 ?v4) (pred_4 ?v3) (pred_7 ?v13 ?v4))
:effect (and (pred_4 ?v13) (pred_7 ?v3 ?v4)
        (not (pred_4 ?v3)) (not (pred_7 ?v13 ?v4))))

(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_2 ?v4) (pred_9 ?v5) 
                  (pred_6 ?v4) (pred_4 ?v5))
:effect (and (pred_3 ) (pred_7 ?v5 ?v4) (not (pred_4 ?v5)))))


	
