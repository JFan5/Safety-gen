(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v12)
             (pred_10 ?v11 ?v7)
             (pred_1 ?v6 ?v7)
             (pred_8 ?v1 ?v6 )
	     (pred_2 ?v6)
             (pred_12 ?v10)
             (pred_5 ?v11)
             (pred_7 ?v7)
             (pred_9 ?v6)
             (pred_11 ?v11)
             (pred_4 ?v6)
             (pred_6 ))



(:action op_4
:parameters (?v5 ?v3 ?v4 ?v13)
:precondition (and (pred_12 ?v5) (pred_12 ?v3) (pred_5 ?v4) (pred_7 ?v13)
          (pred_3 ?v5 ?v3) (pred_10 ?v4 ?v13)
                   (pred_1 ?v3 ?v13) (pred_2 ?v5) 
                   (pred_9 ?v3) (pred_11 ?v4))
:effect (and  (pred_4 ?v3) (not (pred_9 ?v3))))


(:action op_5
:parameters (?v5 ?v8)
:precondition (and (pred_12 ?v5) (pred_12 ?v8)
               (pred_2 ?v5) (pred_3 ?v5 ?v8) (pred_4 ?v8))
:effect (and (pred_2 ?v8) (not (pred_2 ?v5))))

(:action op_2
:parameters (?v5 ?v4)
:precondition (and (pred_12 ?v5) (pred_5 ?v4) 
                  (pred_2 ?v5) (pred_8 ?v4 ?v5) (pred_6 ))
:effect (and (pred_11 ?v4)
   (not (pred_8 ?v4 ?v5)) (not (pred_6 ))))


(:action op_3
:parameters (?v5 ?v9 ?v2)
:precondition (and (pred_12 ?v5) (pred_5 ?v9) (pred_5 ?v2)
                  (pred_2 ?v5) (pred_11 ?v2) (pred_8 ?v9 ?v5))
:effect (and (pred_11 ?v9) (pred_8 ?v2 ?v5)
        (not (pred_11 ?v2)) (not (pred_8 ?v9 ?v5))))

(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_12 ?v5) (pred_5 ?v4) 
                  (pred_2 ?v5) (pred_11 ?v4))
:effect (and (pred_6 ) (pred_8 ?v4 ?v5) (not (pred_11 ?v4)))))


	
