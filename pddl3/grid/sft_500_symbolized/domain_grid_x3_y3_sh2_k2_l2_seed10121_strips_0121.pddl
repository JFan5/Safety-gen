(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v4)
             (pred_11 ?v6 ?v10)
             (pred_12 ?v11 ?v10)
             (pred_4 ?v12 ?v11 )
	     (pred_6 ?v11)
             (pred_5 ?v13)
             (pred_10 ?v6)
             (pred_9 ?v10)
             (pred_2 ?v11)
             (pred_7 ?v6)
             (pred_3 ?v11)
             (pred_8 ))



(:action op_1
:parameters (?v2 ?v5 ?v3 ?v9)
:precondition (and (pred_5 ?v2) (pred_5 ?v5) (pred_10 ?v3) (pred_9 ?v9)
          (pred_1 ?v2 ?v5) (pred_11 ?v3 ?v9)
                   (pred_12 ?v5 ?v9) (pred_6 ?v2) 
                   (pred_2 ?v5) (pred_7 ?v3))
:effect (and  (pred_3 ?v5) (not (pred_2 ?v5))))


(:action op_4
:parameters (?v2 ?v8)
:precondition (and (pred_5 ?v2) (pred_5 ?v8)
               (pred_6 ?v2) (pred_1 ?v2 ?v8) (pred_3 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v2))))

(:action op_5
:parameters (?v2 ?v3)
:precondition (and (pred_5 ?v2) (pred_10 ?v3) 
                  (pred_6 ?v2) (pred_4 ?v3 ?v2) (pred_8 ))
:effect (and (pred_7 ?v3)
   (not (pred_4 ?v3 ?v2)) (not (pred_8 ))))


(:action op_3
:parameters (?v2 ?v7 ?v1)
:precondition (and (pred_5 ?v2) (pred_10 ?v7) (pred_10 ?v1)
                  (pred_6 ?v2) (pred_7 ?v1) (pred_4 ?v7 ?v2))
:effect (and (pred_7 ?v7) (pred_4 ?v1 ?v2)
        (not (pred_7 ?v1)) (not (pred_4 ?v7 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_5 ?v2) (pred_10 ?v3) 
                  (pred_6 ?v2) (pred_7 ?v3))
:effect (and (pred_8 ) (pred_4 ?v3 ?v2) (not (pred_7 ?v3)))))


	
