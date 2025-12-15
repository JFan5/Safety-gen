(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v8 ?v1)
             (pred_5 ?v5 ?v2)
             (pred_1 ?v8 ?v2)
             (pred_2 ?v4 ?v8 )
	     (pred_4 ?v8)
             (pred_11 ?v13)
             (pred_6 ?v5)
             (pred_3 ?v2)
             (pred_12 ?v8)
             (pred_8 ?v5)
             (pred_10 ?v8)
             (pred_7 ))



(:action op_1
:parameters (?v3 ?v9 ?v12 ?v7)
:precondition (and (pred_11 ?v3) (pred_11 ?v9) (pred_6 ?v12) (pred_3 ?v7)
          (pred_9 ?v3 ?v9) (pred_5 ?v12 ?v7)
                   (pred_1 ?v9 ?v7) (pred_4 ?v3) 
                   (pred_12 ?v9) (pred_8 ?v12))
:effect (and  (pred_10 ?v9) (not (pred_12 ?v9))))


(:action op_4
:parameters (?v3 ?v6)
:precondition (and (pred_11 ?v3) (pred_11 ?v6)
               (pred_4 ?v3) (pred_9 ?v3 ?v6) (pred_10 ?v6))
:effect (and (pred_4 ?v6) (not (pred_4 ?v3))))

(:action op_2
:parameters (?v3 ?v12)
:precondition (and (pred_11 ?v3) (pred_6 ?v12) 
                  (pred_4 ?v3) (pred_2 ?v12 ?v3) (pred_7 ))
:effect (and (pred_8 ?v12)
   (not (pred_2 ?v12 ?v3)) (not (pred_7 ))))


(:action op_5
:parameters (?v3 ?v11 ?v10)
:precondition (and (pred_11 ?v3) (pred_6 ?v11) (pred_6 ?v10)
                  (pred_4 ?v3) (pred_8 ?v10) (pred_2 ?v11 ?v3))
:effect (and (pred_8 ?v11) (pred_2 ?v10 ?v3)
        (not (pred_8 ?v10)) (not (pred_2 ?v11 ?v3))))

(:action op_3
:parameters (?v3 ?v12)
:precondition (and (pred_11 ?v3) (pred_6 ?v12) 
                  (pred_4 ?v3) (pred_8 ?v12))
:effect (and (pred_7 ) (pred_2 ?v12 ?v3) (not (pred_8 ?v12)))))


	
