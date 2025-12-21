(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v9)
             (pred_1 ?v4 ?v13)
             (pred_6 ?v6 ?v13)
             (pred_10 ?v11 ?v6 )
	     (pred_3 ?v6)
             (pred_9 ?v8)
             (pred_4 ?v4)
             (pred_5 ?v13)
             (pred_11 ?v6)
             (pred_2 ?v4)
             (pred_7 ?v6)
             (pred_8 ))



(:action op_5
:parameters (?v3 ?v1 ?v7 ?v12)
:precondition (and (pred_9 ?v3) (pred_9 ?v1) (pred_4 ?v7) (pred_5 ?v12)
          (pred_12 ?v3 ?v1) (pred_1 ?v7 ?v12)
                   (pred_6 ?v1 ?v12) (pred_3 ?v3) 
                   (pred_11 ?v1) (pred_2 ?v7))
:effect (and  (pred_7 ?v1) (not (pred_11 ?v1))))


(:action op_4
:parameters (?v3 ?v10)
:precondition (and (pred_9 ?v3) (pred_9 ?v10)
               (pred_3 ?v3) (pred_12 ?v3 ?v10) (pred_7 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v3))))

(:action op_3
:parameters (?v3 ?v7)
:precondition (and (pred_9 ?v3) (pred_4 ?v7) 
                  (pred_3 ?v3) (pred_10 ?v7 ?v3) (pred_8 ))
:effect (and (pred_2 ?v7)
   (not (pred_10 ?v7 ?v3)) (not (pred_8 ))))


(:action op_1
:parameters (?v3 ?v2 ?v5)
:precondition (and (pred_9 ?v3) (pred_4 ?v2) (pred_4 ?v5)
                  (pred_3 ?v3) (pred_2 ?v5) (pred_10 ?v2 ?v3))
:effect (and (pred_2 ?v2) (pred_10 ?v5 ?v3)
        (not (pred_2 ?v5)) (not (pred_10 ?v2 ?v3))))

(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_9 ?v3) (pred_4 ?v7) 
                  (pred_3 ?v3) (pred_2 ?v7))
:effect (and (pred_8 ) (pred_10 ?v7 ?v3) (not (pred_2 ?v7)))))


	
