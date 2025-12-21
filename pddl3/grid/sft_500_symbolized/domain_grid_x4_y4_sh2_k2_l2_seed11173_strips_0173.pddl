(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v3)
             (pred_4 ?v8 ?v13)
             (pred_2 ?v6 ?v13)
             (pred_3 ?v12 ?v6 )
	     (pred_8 ?v6)
             (pred_10 ?v5)
             (pred_7 ?v8)
             (pred_9 ?v13)
             (pred_1 ?v6)
             (pred_6 ?v8)
             (pred_12 ?v6)
             (pred_5 ))



(:action op_5
:parameters (?v11 ?v4 ?v10 ?v2)
:precondition (and (pred_10 ?v11) (pred_10 ?v4) (pred_7 ?v10) (pred_9 ?v2)
          (pred_11 ?v11 ?v4) (pred_4 ?v10 ?v2)
                   (pred_2 ?v4 ?v2) (pred_8 ?v11) 
                   (pred_1 ?v4) (pred_6 ?v10))
:effect (and  (pred_12 ?v4) (not (pred_1 ?v4))))


(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_10 ?v11) (pred_10 ?v1)
               (pred_8 ?v11) (pred_11 ?v11 ?v1) (pred_12 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v11))))

(:action op_3
:parameters (?v11 ?v10)
:precondition (and (pred_10 ?v11) (pred_7 ?v10) 
                  (pred_8 ?v11) (pred_3 ?v10 ?v11) (pred_5 ))
:effect (and (pred_6 ?v10)
   (not (pred_3 ?v10 ?v11)) (not (pred_5 ))))


(:action op_4
:parameters (?v11 ?v7 ?v9)
:precondition (and (pred_10 ?v11) (pred_7 ?v7) (pred_7 ?v9)
                  (pred_8 ?v11) (pred_6 ?v9) (pred_3 ?v7 ?v11))
:effect (and (pred_6 ?v7) (pred_3 ?v9 ?v11)
        (not (pred_6 ?v9)) (not (pred_3 ?v7 ?v11))))

(:action op_2
:parameters (?v11 ?v10)
:precondition (and (pred_10 ?v11) (pred_7 ?v10) 
                  (pred_8 ?v11) (pred_6 ?v10))
:effect (and (pred_5 ) (pred_3 ?v10 ?v11) (not (pred_6 ?v10)))))


	
