(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v12)
             (pred_5 ?v11 ?v1)
             (pred_7 ?v10 ?v1)
             (pred_1 ?v13 ?v10 )
	     (pred_3 ?v10)
             (pred_6 ?v8)
             (pred_12 ?v11)
             (pred_2 ?v1)
             (pred_9 ?v10)
             (pred_11 ?v11)
             (pred_4 ?v10)
             (pred_10 ))



(:action op_5
:parameters (?v5 ?v3 ?v2 ?v6)
:precondition (and (pred_6 ?v5) (pred_6 ?v3) (pred_12 ?v2) (pred_2 ?v6)
          (pred_8 ?v5 ?v3) (pred_5 ?v2 ?v6)
                   (pred_7 ?v3 ?v6) (pred_3 ?v5) 
                   (pred_9 ?v3) (pred_11 ?v2))
:effect (and  (pred_4 ?v3) (not (pred_9 ?v3))))


(:action op_4
:parameters (?v5 ?v7)
:precondition (and (pred_6 ?v5) (pred_6 ?v7)
               (pred_3 ?v5) (pred_8 ?v5 ?v7) (pred_4 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v5))))

(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_6 ?v5) (pred_12 ?v2) 
                  (pred_3 ?v5) (pred_1 ?v2 ?v5) (pred_10 ))
:effect (and (pred_11 ?v2)
   (not (pred_1 ?v2 ?v5)) (not (pred_10 ))))


(:action op_3
:parameters (?v5 ?v4 ?v9)
:precondition (and (pred_6 ?v5) (pred_12 ?v4) (pred_12 ?v9)
                  (pred_3 ?v5) (pred_11 ?v9) (pred_1 ?v4 ?v5))
:effect (and (pred_11 ?v4) (pred_1 ?v9 ?v5)
        (not (pred_11 ?v9)) (not (pred_1 ?v4 ?v5))))

(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_6 ?v5) (pred_12 ?v2) 
                  (pred_3 ?v5) (pred_11 ?v2))
:effect (and (pred_10 ) (pred_1 ?v2 ?v5) (not (pred_11 ?v2)))))


	
