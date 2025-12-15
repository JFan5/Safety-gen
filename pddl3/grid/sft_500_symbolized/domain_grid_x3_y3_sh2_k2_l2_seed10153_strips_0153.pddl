(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v7)
             (pred_1 ?v6 ?v5)
             (pred_9 ?v10 ?v5)
             (pred_12 ?v13 ?v10 )
	     (pred_4 ?v10)
             (pred_3 ?v11)
             (pred_6 ?v6)
             (pred_11 ?v5)
             (pred_10 ?v10)
             (pred_7 ?v6)
             (pred_5 ?v10)
             (pred_8 ))



(:action op_2
:parameters (?v3 ?v9 ?v8 ?v1)
:precondition (and (pred_3 ?v3) (pred_3 ?v9) (pred_6 ?v8) (pred_11 ?v1)
          (pred_2 ?v3 ?v9) (pred_1 ?v8 ?v1)
                   (pred_9 ?v9 ?v1) (pred_4 ?v3) 
                   (pred_10 ?v9) (pred_7 ?v8))
:effect (and  (pred_5 ?v9) (not (pred_10 ?v9))))


(:action op_5
:parameters (?v3 ?v12)
:precondition (and (pred_3 ?v3) (pred_3 ?v12)
               (pred_4 ?v3) (pred_2 ?v3 ?v12) (pred_5 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v3))))

(:action op_3
:parameters (?v3 ?v8)
:precondition (and (pred_3 ?v3) (pred_6 ?v8) 
                  (pred_4 ?v3) (pred_12 ?v8 ?v3) (pred_8 ))
:effect (and (pred_7 ?v8)
   (not (pred_12 ?v8 ?v3)) (not (pred_8 ))))


(:action op_1
:parameters (?v3 ?v4 ?v2)
:precondition (and (pred_3 ?v3) (pred_6 ?v4) (pred_6 ?v2)
                  (pred_4 ?v3) (pred_7 ?v2) (pred_12 ?v4 ?v3))
:effect (and (pred_7 ?v4) (pred_12 ?v2 ?v3)
        (not (pred_7 ?v2)) (not (pred_12 ?v4 ?v3))))

(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_3 ?v3) (pred_6 ?v8) 
                  (pred_4 ?v3) (pred_7 ?v8))
:effect (and (pred_8 ) (pred_12 ?v8 ?v3) (not (pred_7 ?v8)))))


	
