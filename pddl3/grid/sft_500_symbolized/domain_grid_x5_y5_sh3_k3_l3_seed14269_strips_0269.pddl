(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v7 ?v4)
             (pred_9 ?v12 ?v6)
             (pred_10 ?v7 ?v6)
             (pred_12 ?v9 ?v7 )
	     (pred_3 ?v7)
             (pred_11 ?v11)
             (pred_5 ?v12)
             (pred_6 ?v6)
             (pred_7 ?v7)
             (pred_4 ?v12)
             (pred_1 ?v7)
             (pred_8 ))



(:action op_1
:parameters (?v5 ?v3 ?v2 ?v10)
:precondition (and (pred_11 ?v5) (pred_11 ?v3) (pred_5 ?v2) (pred_6 ?v10)
          (pred_2 ?v5 ?v3) (pred_9 ?v2 ?v10)
                   (pred_10 ?v3 ?v10) (pred_3 ?v5) 
                   (pred_7 ?v3) (pred_4 ?v2))
:effect (and  (pred_1 ?v3) (not (pred_7 ?v3))))


(:action op_3
:parameters (?v5 ?v8)
:precondition (and (pred_11 ?v5) (pred_11 ?v8)
               (pred_3 ?v5) (pred_2 ?v5 ?v8) (pred_1 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v5))))

(:action op_4
:parameters (?v5 ?v2)
:precondition (and (pred_11 ?v5) (pred_5 ?v2) 
                  (pred_3 ?v5) (pred_12 ?v2 ?v5) (pred_8 ))
:effect (and (pred_4 ?v2)
   (not (pred_12 ?v2 ?v5)) (not (pred_8 ))))


(:action op_5
:parameters (?v5 ?v1 ?v13)
:precondition (and (pred_11 ?v5) (pred_5 ?v1) (pred_5 ?v13)
                  (pred_3 ?v5) (pred_4 ?v13) (pred_12 ?v1 ?v5))
:effect (and (pred_4 ?v1) (pred_12 ?v13 ?v5)
        (not (pred_4 ?v13)) (not (pred_12 ?v1 ?v5))))

(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_11 ?v5) (pred_5 ?v2) 
                  (pred_3 ?v5) (pred_4 ?v2))
:effect (and (pred_8 ) (pred_12 ?v2 ?v5) (not (pred_4 ?v2)))))


	
