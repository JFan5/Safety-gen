(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v10 ?v1)
             (pred_9 ?v13 ?v4)
             (pred_2 ?v10 ?v4)
             (pred_10 ?v6 ?v10 )
	     (pred_11 ?v10)
             (pred_8 ?v2)
             (pred_4 ?v13)
             (pred_6 ?v4)
             (pred_3 ?v10)
             (pred_7 ?v13)
             (pred_12 ?v10)
             (pred_1 ))



(:action op_3
:parameters (?v11 ?v3 ?v9 ?v12)
:precondition (and (pred_8 ?v11) (pred_8 ?v3) (pred_4 ?v9) (pred_6 ?v12)
          (pred_5 ?v11 ?v3) (pred_9 ?v9 ?v12)
                   (pred_2 ?v3 ?v12) (pred_11 ?v11) 
                   (pred_3 ?v3) (pred_7 ?v9))
:effect (and  (pred_12 ?v3) (not (pred_3 ?v3))))


(:action op_5
:parameters (?v11 ?v8)
:precondition (and (pred_8 ?v11) (pred_8 ?v8)
               (pred_11 ?v11) (pred_5 ?v11 ?v8) (pred_12 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v11))))

(:action op_1
:parameters (?v11 ?v9)
:precondition (and (pred_8 ?v11) (pred_4 ?v9) 
                  (pred_11 ?v11) (pred_10 ?v9 ?v11) (pred_1 ))
:effect (and (pred_7 ?v9)
   (not (pred_10 ?v9 ?v11)) (not (pred_1 ))))


(:action op_4
:parameters (?v11 ?v5 ?v7)
:precondition (and (pred_8 ?v11) (pred_4 ?v5) (pred_4 ?v7)
                  (pred_11 ?v11) (pred_7 ?v7) (pred_10 ?v5 ?v11))
:effect (and (pred_7 ?v5) (pred_10 ?v7 ?v11)
        (not (pred_7 ?v7)) (not (pred_10 ?v5 ?v11))))

(:action op_2
:parameters (?v11 ?v9)
:precondition (and (pred_8 ?v11) (pred_4 ?v9) 
                  (pred_11 ?v11) (pred_7 ?v9))
:effect (and (pred_1 ) (pred_10 ?v9 ?v11) (not (pred_7 ?v9)))))


	
