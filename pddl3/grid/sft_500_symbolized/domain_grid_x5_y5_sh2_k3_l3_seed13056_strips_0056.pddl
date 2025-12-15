(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v7)
             (pred_5 ?v8 ?v9)
             (pred_6 ?v13 ?v9)
             (pred_10 ?v10 ?v13 )
	     (pred_2 ?v13)
             (pred_12 ?v12)
             (pred_11 ?v8)
             (pred_4 ?v9)
             (pred_1 ?v13)
             (pred_3 ?v8)
             (pred_8 ?v13)
             (pred_9 ))



(:action op_4
:parameters (?v3 ?v5 ?v6 ?v2)
:precondition (and (pred_12 ?v3) (pred_12 ?v5) (pred_11 ?v6) (pred_4 ?v2)
          (pred_7 ?v3 ?v5) (pred_5 ?v6 ?v2)
                   (pred_6 ?v5 ?v2) (pred_2 ?v3) 
                   (pred_1 ?v5) (pred_3 ?v6))
:effect (and  (pred_8 ?v5) (not (pred_1 ?v5))))


(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_12 ?v3) (pred_12 ?v1)
               (pred_2 ?v3) (pred_7 ?v3 ?v1) (pred_8 ?v1))
:effect (and (pred_2 ?v1) (not (pred_2 ?v3))))

(:action op_3
:parameters (?v3 ?v6)
:precondition (and (pred_12 ?v3) (pred_11 ?v6) 
                  (pred_2 ?v3) (pred_10 ?v6 ?v3) (pred_9 ))
:effect (and (pred_3 ?v6)
   (not (pred_10 ?v6 ?v3)) (not (pred_9 ))))


(:action op_1
:parameters (?v3 ?v4 ?v11)
:precondition (and (pred_12 ?v3) (pred_11 ?v4) (pred_11 ?v11)
                  (pred_2 ?v3) (pred_3 ?v11) (pred_10 ?v4 ?v3))
:effect (and (pred_3 ?v4) (pred_10 ?v11 ?v3)
        (not (pred_3 ?v11)) (not (pred_10 ?v4 ?v3))))

(:action op_5
:parameters (?v3 ?v6)
:precondition (and (pred_12 ?v3) (pred_11 ?v6) 
                  (pred_2 ?v3) (pred_3 ?v6))
:effect (and (pred_9 ) (pred_10 ?v6 ?v3) (not (pred_3 ?v6)))))


	
