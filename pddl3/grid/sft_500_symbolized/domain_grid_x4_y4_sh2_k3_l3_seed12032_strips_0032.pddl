(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v1)
             (pred_6 ?v5 ?v4)
             (pred_3 ?v8 ?v4)
             (pred_4 ?v9 ?v8 )
	     (pred_7 ?v8)
             (pred_10 ?v6)
             (pred_1 ?v5)
             (pred_11 ?v4)
             (pred_8 ?v8)
             (pred_2 ?v5)
             (pred_12 ?v8)
             (pred_9 ))



(:action op_2
:parameters (?v11 ?v2 ?v12 ?v10)
:precondition (and (pred_10 ?v11) (pred_10 ?v2) (pred_1 ?v12) (pred_11 ?v10)
          (pred_5 ?v11 ?v2) (pred_6 ?v12 ?v10)
                   (pred_3 ?v2 ?v10) (pred_7 ?v11) 
                   (pred_8 ?v2) (pred_2 ?v12))
:effect (and  (pred_12 ?v2) (not (pred_8 ?v2))))


(:action op_1
:parameters (?v11 ?v7)
:precondition (and (pred_10 ?v11) (pred_10 ?v7)
               (pred_7 ?v11) (pred_5 ?v11 ?v7) (pred_12 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v11))))

(:action op_3
:parameters (?v11 ?v12)
:precondition (and (pred_10 ?v11) (pred_1 ?v12) 
                  (pred_7 ?v11) (pred_4 ?v12 ?v11) (pred_9 ))
:effect (and (pred_2 ?v12)
   (not (pred_4 ?v12 ?v11)) (not (pred_9 ))))


(:action op_5
:parameters (?v11 ?v13 ?v3)
:precondition (and (pred_10 ?v11) (pred_1 ?v13) (pred_1 ?v3)
                  (pred_7 ?v11) (pred_2 ?v3) (pred_4 ?v13 ?v11))
:effect (and (pred_2 ?v13) (pred_4 ?v3 ?v11)
        (not (pred_2 ?v3)) (not (pred_4 ?v13 ?v11))))

(:action op_4
:parameters (?v11 ?v12)
:precondition (and (pred_10 ?v11) (pred_1 ?v12) 
                  (pred_7 ?v11) (pred_2 ?v12))
:effect (and (pred_9 ) (pred_4 ?v12 ?v11) (not (pred_2 ?v12)))))


	
