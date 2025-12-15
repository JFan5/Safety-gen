(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v9 ?v4)
             (pred_3 ?v6 ?v2)
             (pred_5 ?v9 ?v2)
             (pred_11 ?v11 ?v9 )
	     (pred_7 ?v9)
             (pred_10 ?v13)
             (pred_2 ?v6)
             (pred_4 ?v2)
             (pred_9 ?v9)
             (pred_8 ?v6)
             (pred_1 ?v9)
             (pred_6 ))



(:action op_2
:parameters (?v3 ?v1 ?v12 ?v5)
:precondition (and (pred_10 ?v3) (pred_10 ?v1) (pred_2 ?v12) (pred_4 ?v5)
          (pred_12 ?v3 ?v1) (pred_3 ?v12 ?v5)
                   (pred_5 ?v1 ?v5) (pred_7 ?v3) 
                   (pred_9 ?v1) (pred_8 ?v12))
:effect (and  (pred_1 ?v1) (not (pred_9 ?v1))))


(:action op_5
:parameters (?v3 ?v7)
:precondition (and (pred_10 ?v3) (pred_10 ?v7)
               (pred_7 ?v3) (pred_12 ?v3 ?v7) (pred_1 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v3))))

(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_2 ?v12) 
                  (pred_7 ?v3) (pred_11 ?v12 ?v3) (pred_6 ))
:effect (and (pred_8 ?v12)
   (not (pred_11 ?v12 ?v3)) (not (pred_6 ))))


(:action op_1
:parameters (?v3 ?v10 ?v8)
:precondition (and (pred_10 ?v3) (pred_2 ?v10) (pred_2 ?v8)
                  (pred_7 ?v3) (pred_8 ?v8) (pred_11 ?v10 ?v3))
:effect (and (pred_8 ?v10) (pred_11 ?v8 ?v3)
        (not (pred_8 ?v8)) (not (pred_11 ?v10 ?v3))))

(:action op_3
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_2 ?v12) 
                  (pred_7 ?v3) (pred_8 ?v12))
:effect (and (pred_6 ) (pred_11 ?v12 ?v3) (not (pred_8 ?v12)))))


	
