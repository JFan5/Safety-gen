(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v7)
             (pred_2 ?v8 ?v13)
             (pred_1 ?v5 ?v13)
             (pred_3 ?v2 ?v5 )
	     (pred_7 ?v5)
             (pred_4 ?v3)
             (pred_9 ?v8)
             (pred_5 ?v13)
             (pred_11 ?v5)
             (pred_8 ?v8)
             (pred_12 ?v5)
             (pred_10 ))



(:action op_1
:parameters (?v11 ?v10 ?v4 ?v1)
:precondition (and (pred_4 ?v11) (pred_4 ?v10) (pred_9 ?v4) (pred_5 ?v1)
          (pred_6 ?v11 ?v10) (pred_2 ?v4 ?v1)
                   (pred_1 ?v10 ?v1) (pred_7 ?v11) 
                   (pred_11 ?v10) (pred_8 ?v4))
:effect (and  (pred_12 ?v10) (not (pred_11 ?v10))))


(:action op_3
:parameters (?v11 ?v9)
:precondition (and (pred_4 ?v11) (pred_4 ?v9)
               (pred_7 ?v11) (pred_6 ?v11 ?v9) (pred_12 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v11))))

(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_4 ?v11) (pred_9 ?v4) 
                  (pred_7 ?v11) (pred_3 ?v4 ?v11) (pred_10 ))
:effect (and (pred_8 ?v4)
   (not (pred_3 ?v4 ?v11)) (not (pred_10 ))))


(:action op_5
:parameters (?v11 ?v6 ?v12)
:precondition (and (pred_4 ?v11) (pred_9 ?v6) (pred_9 ?v12)
                  (pred_7 ?v11) (pred_8 ?v12) (pred_3 ?v6 ?v11))
:effect (and (pred_8 ?v6) (pred_3 ?v12 ?v11)
        (not (pred_8 ?v12)) (not (pred_3 ?v6 ?v11))))

(:action op_4
:parameters (?v11 ?v4)
:precondition (and (pred_4 ?v11) (pred_9 ?v4) 
                  (pred_7 ?v11) (pred_8 ?v4))
:effect (and (pred_10 ) (pred_3 ?v4 ?v11) (not (pred_8 ?v4)))))


	
