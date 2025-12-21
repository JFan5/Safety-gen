(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v9)
             (pred_9 ?v13 ?v8)
             (pred_7 ?v10 ?v8)
             (pred_6 ?v11 ?v10 )
	     (pred_12 ?v10)
             (pred_8 ?v5)
             (pred_10 ?v13)
             (pred_5 ?v8)
             (pred_1 ?v10)
             (pred_11 ?v13)
             (pred_3 ?v10)
             (pred_4 ))



(:action op_4
:parameters (?v7 ?v1 ?v4 ?v12)
:precondition (and (pred_8 ?v7) (pred_8 ?v1) (pred_10 ?v4) (pred_5 ?v12)
          (pred_2 ?v7 ?v1) (pred_9 ?v4 ?v12)
                   (pred_7 ?v1 ?v12) (pred_12 ?v7) 
                   (pred_1 ?v1) (pred_11 ?v4))
:effect (and  (pred_3 ?v1) (not (pred_1 ?v1))))


(:action op_2
:parameters (?v7 ?v2)
:precondition (and (pred_8 ?v7) (pred_8 ?v2)
               (pred_12 ?v7) (pred_2 ?v7 ?v2) (pred_3 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v7))))

(:action op_3
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_10 ?v4) 
                  (pred_12 ?v7) (pred_6 ?v4 ?v7) (pred_4 ))
:effect (and (pred_11 ?v4)
   (not (pred_6 ?v4 ?v7)) (not (pred_4 ))))


(:action op_5
:parameters (?v7 ?v6 ?v3)
:precondition (and (pred_8 ?v7) (pred_10 ?v6) (pred_10 ?v3)
                  (pred_12 ?v7) (pred_11 ?v3) (pred_6 ?v6 ?v7))
:effect (and (pred_11 ?v6) (pred_6 ?v3 ?v7)
        (not (pred_11 ?v3)) (not (pred_6 ?v6 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_10 ?v4) 
                  (pred_12 ?v7) (pred_11 ?v4))
:effect (and (pred_4 ) (pred_6 ?v4 ?v7) (not (pred_11 ?v4)))))


	
