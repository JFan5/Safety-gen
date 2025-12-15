(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v2)
             (pred_7 ?v6 ?v3)
             (pred_12 ?v13 ?v3)
             (pred_2 ?v4 ?v13 )
	     (pred_4 ?v13)
             (pred_5 ?v9)
             (pred_9 ?v6)
             (pred_3 ?v3)
             (pred_10 ?v13)
             (pred_6 ?v6)
             (pred_8 ?v13)
             (pred_1 ))



(:action op_2
:parameters (?v11 ?v10 ?v12 ?v8)
:precondition (and (pred_5 ?v11) (pred_5 ?v10) (pred_9 ?v12) (pred_3 ?v8)
          (pred_11 ?v11 ?v10) (pred_7 ?v12 ?v8)
                   (pred_12 ?v10 ?v8) (pred_4 ?v11) 
                   (pred_10 ?v10) (pred_6 ?v12))
:effect (and  (pred_8 ?v10) (not (pred_10 ?v10))))


(:action op_5
:parameters (?v11 ?v7)
:precondition (and (pred_5 ?v11) (pred_5 ?v7)
               (pred_4 ?v11) (pred_11 ?v11 ?v7) (pred_8 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v11))))

(:action op_1
:parameters (?v11 ?v12)
:precondition (and (pred_5 ?v11) (pred_9 ?v12) 
                  (pred_4 ?v11) (pred_2 ?v12 ?v11) (pred_1 ))
:effect (and (pred_6 ?v12)
   (not (pred_2 ?v12 ?v11)) (not (pred_1 ))))


(:action op_4
:parameters (?v11 ?v5 ?v1)
:precondition (and (pred_5 ?v11) (pred_9 ?v5) (pred_9 ?v1)
                  (pred_4 ?v11) (pred_6 ?v1) (pred_2 ?v5 ?v11))
:effect (and (pred_6 ?v5) (pred_2 ?v1 ?v11)
        (not (pred_6 ?v1)) (not (pred_2 ?v5 ?v11))))

(:action op_3
:parameters (?v11 ?v12)
:precondition (and (pred_5 ?v11) (pred_9 ?v12) 
                  (pred_4 ?v11) (pred_6 ?v12))
:effect (and (pred_1 ) (pred_2 ?v12 ?v11) (not (pred_6 ?v12)))))


	
