(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v1 ?v8)
             (pred_6 ?v10 ?v13)
             (pred_1 ?v1 ?v13)
             (pred_2 ?v4 ?v1 )
	     (pred_11 ?v1)
             (pred_7 ?v5)
             (pred_4 ?v10)
             (pred_8 ?v13)
             (pred_5 ?v1)
             (pred_3 ?v10)
             (pred_10 ?v1)
             (pred_12 ))



(:action op_3
:parameters (?v3 ?v9 ?v6 ?v7)
:precondition (and (pred_7 ?v3) (pred_7 ?v9) (pred_4 ?v6) (pred_8 ?v7)
          (pred_9 ?v3 ?v9) (pred_6 ?v6 ?v7)
                   (pred_1 ?v9 ?v7) (pred_11 ?v3) 
                   (pred_5 ?v9) (pred_3 ?v6))
:effect (and  (pred_10 ?v9) (not (pred_5 ?v9))))


(:action op_1
:parameters (?v3 ?v12)
:precondition (and (pred_7 ?v3) (pred_7 ?v12)
               (pred_11 ?v3) (pred_9 ?v3 ?v12) (pred_10 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v3))))

(:action op_2
:parameters (?v3 ?v6)
:precondition (and (pred_7 ?v3) (pred_4 ?v6) 
                  (pred_11 ?v3) (pred_2 ?v6 ?v3) (pred_12 ))
:effect (and (pred_3 ?v6)
   (not (pred_2 ?v6 ?v3)) (not (pred_12 ))))


(:action op_4
:parameters (?v3 ?v2 ?v11)
:precondition (and (pred_7 ?v3) (pred_4 ?v2) (pred_4 ?v11)
                  (pred_11 ?v3) (pred_3 ?v11) (pred_2 ?v2 ?v3))
:effect (and (pred_3 ?v2) (pred_2 ?v11 ?v3)
        (not (pred_3 ?v11)) (not (pred_2 ?v2 ?v3))))

(:action op_5
:parameters (?v3 ?v6)
:precondition (and (pred_7 ?v3) (pred_4 ?v6) 
                  (pred_11 ?v3) (pred_3 ?v6))
:effect (and (pred_12 ) (pred_2 ?v6 ?v3) (not (pred_3 ?v6)))))


	
