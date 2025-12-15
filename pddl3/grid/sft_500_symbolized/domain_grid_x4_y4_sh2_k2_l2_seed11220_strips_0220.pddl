(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v10)
             (pred_8 ?v4 ?v11)
             (pred_9 ?v8 ?v11)
             (pred_5 ?v13 ?v8 )
	     (pred_7 ?v8)
             (pred_6 ?v9)
             (pred_1 ?v4)
             (pred_2 ?v11)
             (pred_3 ?v8)
             (pred_4 ?v4)
             (pred_12 ?v8)
             (pred_10 ))



(:action op_5
:parameters (?v3 ?v2 ?v1 ?v5)
:precondition (and (pred_6 ?v3) (pred_6 ?v2) (pred_1 ?v1) (pred_2 ?v5)
          (pred_11 ?v3 ?v2) (pred_8 ?v1 ?v5)
                   (pred_9 ?v2 ?v5) (pred_7 ?v3) 
                   (pred_3 ?v2) (pred_4 ?v1))
:effect (and  (pred_12 ?v2) (not (pred_3 ?v2))))


(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_6 ?v3) (pred_6 ?v12)
               (pred_7 ?v3) (pred_11 ?v3 ?v12) (pred_12 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v3))))

(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_1 ?v1) 
                  (pred_7 ?v3) (pred_5 ?v1 ?v3) (pred_10 ))
:effect (and (pred_4 ?v1)
   (not (pred_5 ?v1 ?v3)) (not (pred_10 ))))


(:action op_2
:parameters (?v3 ?v6 ?v7)
:precondition (and (pred_6 ?v3) (pred_1 ?v6) (pred_1 ?v7)
                  (pred_7 ?v3) (pred_4 ?v7) (pred_5 ?v6 ?v3))
:effect (and (pred_4 ?v6) (pred_5 ?v7 ?v3)
        (not (pred_4 ?v7)) (not (pred_5 ?v6 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_1 ?v1) 
                  (pred_7 ?v3) (pred_4 ?v1))
:effect (and (pred_10 ) (pred_5 ?v1 ?v3) (not (pred_4 ?v1)))))


	
