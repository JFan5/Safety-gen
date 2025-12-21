(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v5)
             (pred_10 ?v3 ?v13)
             (pred_5 ?v4 ?v13)
             (pred_2 ?v8 ?v4 )
	     (pred_4 ?v4)
             (pred_7 ?v10)
             (pred_8 ?v3)
             (pred_9 ?v13)
             (pred_3 ?v4)
             (pred_12 ?v3)
             (pred_11 ?v4)
             (pred_6 ))



(:action op_3
:parameters (?v11 ?v12 ?v9 ?v6)
:precondition (and (pred_7 ?v11) (pred_7 ?v12) (pred_8 ?v9) (pred_9 ?v6)
          (pred_1 ?v11 ?v12) (pred_10 ?v9 ?v6)
                   (pred_5 ?v12 ?v6) (pred_4 ?v11) 
                   (pred_3 ?v12) (pred_12 ?v9))
:effect (and  (pred_11 ?v12) (not (pred_3 ?v12))))


(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_7 ?v11) (pred_7 ?v1)
               (pred_4 ?v11) (pred_1 ?v11 ?v1) (pred_11 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v11))))

(:action op_2
:parameters (?v11 ?v9)
:precondition (and (pred_7 ?v11) (pred_8 ?v9) 
                  (pred_4 ?v11) (pred_2 ?v9 ?v11) (pred_6 ))
:effect (and (pred_12 ?v9)
   (not (pred_2 ?v9 ?v11)) (not (pred_6 ))))


(:action op_4
:parameters (?v11 ?v2 ?v7)
:precondition (and (pred_7 ?v11) (pred_8 ?v2) (pred_8 ?v7)
                  (pred_4 ?v11) (pred_12 ?v7) (pred_2 ?v2 ?v11))
:effect (and (pred_12 ?v2) (pred_2 ?v7 ?v11)
        (not (pred_12 ?v7)) (not (pred_2 ?v2 ?v11))))

(:action op_5
:parameters (?v11 ?v9)
:precondition (and (pred_7 ?v11) (pred_8 ?v9) 
                  (pred_4 ?v11) (pred_12 ?v9))
:effect (and (pred_6 ) (pred_2 ?v9 ?v11) (not (pred_12 ?v9)))))


	
