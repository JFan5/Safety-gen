(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v7 ?v1)
             (pred_3 ?v4 ?v9)
             (pred_5 ?v7 ?v9)
             (pred_9 ?v13 ?v7 )
	     (pred_8 ?v7)
             (pred_6 ?v12)
             (pred_10 ?v4)
             (pred_12 ?v9)
             (pred_7 ?v7)
             (pred_11 ?v4)
             (pred_4 ?v7)
             (pred_1 ))



(:action op_4
:parameters (?v3 ?v2 ?v6 ?v11)
:precondition (and (pred_6 ?v3) (pred_6 ?v2) (pred_10 ?v6) (pred_12 ?v11)
          (pred_2 ?v3 ?v2) (pred_3 ?v6 ?v11)
                   (pred_5 ?v2 ?v11) (pred_8 ?v3) 
                   (pred_7 ?v2) (pred_11 ?v6))
:effect (and  (pred_4 ?v2) (not (pred_7 ?v2))))


(:action op_2
:parameters (?v3 ?v8)
:precondition (and (pred_6 ?v3) (pred_6 ?v8)
               (pred_8 ?v3) (pred_2 ?v3 ?v8) (pred_4 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v3))))

(:action op_5
:parameters (?v3 ?v6)
:precondition (and (pred_6 ?v3) (pred_10 ?v6) 
                  (pred_8 ?v3) (pred_9 ?v6 ?v3) (pred_1 ))
:effect (and (pred_11 ?v6)
   (not (pred_9 ?v6 ?v3)) (not (pred_1 ))))


(:action op_3
:parameters (?v3 ?v10 ?v5)
:precondition (and (pred_6 ?v3) (pred_10 ?v10) (pred_10 ?v5)
                  (pred_8 ?v3) (pred_11 ?v5) (pred_9 ?v10 ?v3))
:effect (and (pred_11 ?v10) (pred_9 ?v5 ?v3)
        (not (pred_11 ?v5)) (not (pred_9 ?v10 ?v3))))

(:action op_1
:parameters (?v3 ?v6)
:precondition (and (pred_6 ?v3) (pred_10 ?v6) 
                  (pred_8 ?v3) (pred_11 ?v6))
:effect (and (pred_1 ) (pred_9 ?v6 ?v3) (not (pred_11 ?v6)))))


	
