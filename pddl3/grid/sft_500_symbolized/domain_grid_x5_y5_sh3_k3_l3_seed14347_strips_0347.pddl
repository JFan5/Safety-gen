(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v3)
             (pred_2 ?v5 ?v10)
             (pred_7 ?v6 ?v10)
             (pred_10 ?v7 ?v6 )
	     (pred_8 ?v6)
             (pred_5 ?v1)
             (pred_3 ?v5)
             (pred_9 ?v10)
             (pred_1 ?v6)
             (pred_6 ?v5)
             (pred_4 ?v6)
             (pred_12 ))



(:action op_4
:parameters (?v12 ?v11 ?v9 ?v8)
:precondition (and (pred_5 ?v12) (pred_5 ?v11) (pred_3 ?v9) (pred_9 ?v8)
          (pred_11 ?v12 ?v11) (pred_2 ?v9 ?v8)
                   (pred_7 ?v11 ?v8) (pred_8 ?v12) 
                   (pred_1 ?v11) (pred_6 ?v9))
:effect (and  (pred_4 ?v11) (not (pred_1 ?v11))))


(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_5 ?v2)
               (pred_8 ?v12) (pred_11 ?v12 ?v2) (pred_4 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_5 ?v12) (pred_3 ?v9) 
                  (pred_8 ?v12) (pred_10 ?v9 ?v12) (pred_12 ))
:effect (and (pred_6 ?v9)
   (not (pred_10 ?v9 ?v12)) (not (pred_12 ))))


(:action op_5
:parameters (?v12 ?v4 ?v13)
:precondition (and (pred_5 ?v12) (pred_3 ?v4) (pred_3 ?v13)
                  (pred_8 ?v12) (pred_6 ?v13) (pred_10 ?v4 ?v12))
:effect (and (pred_6 ?v4) (pred_10 ?v13 ?v12)
        (not (pred_6 ?v13)) (not (pred_10 ?v4 ?v12))))

(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_5 ?v12) (pred_3 ?v9) 
                  (pred_8 ?v12) (pred_6 ?v9))
:effect (and (pred_12 ) (pred_10 ?v9 ?v12) (not (pred_6 ?v9)))))


	
