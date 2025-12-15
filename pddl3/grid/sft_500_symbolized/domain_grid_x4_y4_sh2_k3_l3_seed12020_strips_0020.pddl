(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v4)
             (pred_4 ?v13 ?v2)
             (pred_6 ?v10 ?v2)
             (pred_7 ?v5 ?v10 )
	     (pred_12 ?v10)
             (pred_10 ?v12)
             (pred_3 ?v13)
             (pred_9 ?v2)
             (pred_11 ?v10)
             (pred_5 ?v13)
             (pred_1 ?v10)
             (pred_8 ))



(:action op_1
:parameters (?v1 ?v11 ?v8 ?v3)
:precondition (and (pred_10 ?v1) (pred_10 ?v11) (pred_3 ?v8) (pred_9 ?v3)
          (pred_2 ?v1 ?v11) (pred_4 ?v8 ?v3)
                   (pred_6 ?v11 ?v3) (pred_12 ?v1) 
                   (pred_11 ?v11) (pred_5 ?v8))
:effect (and  (pred_1 ?v11) (not (pred_11 ?v11))))


(:action op_4
:parameters (?v1 ?v7)
:precondition (and (pred_10 ?v1) (pred_10 ?v7)
               (pred_12 ?v1) (pred_2 ?v1 ?v7) (pred_1 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v1))))

(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_10 ?v1) (pred_3 ?v8) 
                  (pred_12 ?v1) (pred_7 ?v8 ?v1) (pred_8 ))
:effect (and (pred_5 ?v8)
   (not (pred_7 ?v8 ?v1)) (not (pred_8 ))))


(:action op_2
:parameters (?v1 ?v9 ?v6)
:precondition (and (pred_10 ?v1) (pred_3 ?v9) (pred_3 ?v6)
                  (pred_12 ?v1) (pred_5 ?v6) (pred_7 ?v9 ?v1))
:effect (and (pred_5 ?v9) (pred_7 ?v6 ?v1)
        (not (pred_5 ?v6)) (not (pred_7 ?v9 ?v1))))

(:action op_5
:parameters (?v1 ?v8)
:precondition (and (pred_10 ?v1) (pred_3 ?v8) 
                  (pred_12 ?v1) (pred_5 ?v8))
:effect (and (pred_8 ) (pred_7 ?v8 ?v1) (not (pred_5 ?v8)))))


	
