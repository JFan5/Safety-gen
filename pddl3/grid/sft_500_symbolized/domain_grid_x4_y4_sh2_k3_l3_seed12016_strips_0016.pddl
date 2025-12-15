(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v13)
             (pred_1 ?v10 ?v12)
             (pred_4 ?v6 ?v12)
             (pred_10 ?v7 ?v6 )
	     (pred_11 ?v6)
             (pred_6 ?v3)
             (pred_5 ?v10)
             (pred_12 ?v12)
             (pred_7 ?v6)
             (pred_8 ?v10)
             (pred_3 ?v6)
             (pred_2 ))



(:action op_4
:parameters (?v5 ?v11 ?v8 ?v1)
:precondition (and (pred_6 ?v5) (pred_6 ?v11) (pred_5 ?v8) (pred_12 ?v1)
          (pred_9 ?v5 ?v11) (pred_1 ?v8 ?v1)
                   (pred_4 ?v11 ?v1) (pred_11 ?v5) 
                   (pred_7 ?v11) (pred_8 ?v8))
:effect (and  (pred_3 ?v11) (not (pred_7 ?v11))))


(:action op_2
:parameters (?v5 ?v4)
:precondition (and (pred_6 ?v5) (pred_6 ?v4)
               (pred_11 ?v5) (pred_9 ?v5 ?v4) (pred_3 ?v4))
:effect (and (pred_11 ?v4) (not (pred_11 ?v5))))

(:action op_3
:parameters (?v5 ?v8)
:precondition (and (pred_6 ?v5) (pred_5 ?v8) 
                  (pred_11 ?v5) (pred_10 ?v8 ?v5) (pred_2 ))
:effect (and (pred_8 ?v8)
   (not (pred_10 ?v8 ?v5)) (not (pred_2 ))))


(:action op_1
:parameters (?v5 ?v2 ?v9)
:precondition (and (pred_6 ?v5) (pred_5 ?v2) (pred_5 ?v9)
                  (pred_11 ?v5) (pred_8 ?v9) (pred_10 ?v2 ?v5))
:effect (and (pred_8 ?v2) (pred_10 ?v9 ?v5)
        (not (pred_8 ?v9)) (not (pred_10 ?v2 ?v5))))

(:action op_5
:parameters (?v5 ?v8)
:precondition (and (pred_6 ?v5) (pred_5 ?v8) 
                  (pred_11 ?v5) (pred_8 ?v8))
:effect (and (pred_2 ) (pred_10 ?v8 ?v5) (not (pred_8 ?v8)))))


	
