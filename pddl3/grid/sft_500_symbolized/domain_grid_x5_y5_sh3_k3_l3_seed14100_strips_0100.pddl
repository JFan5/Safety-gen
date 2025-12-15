(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v9)
             (pred_2 ?v6 ?v3)
             (pred_6 ?v2 ?v3)
             (pred_4 ?v4 ?v2 )
	     (pred_3 ?v2)
             (pred_1 ?v1)
             (pred_8 ?v6)
             (pred_12 ?v3)
             (pred_5 ?v2)
             (pred_10 ?v6)
             (pred_11 ?v2)
             (pred_7 ))



(:action op_1
:parameters (?v10 ?v11 ?v13 ?v7)
:precondition (and (pred_1 ?v10) (pred_1 ?v11) (pred_8 ?v13) (pred_12 ?v7)
          (pred_9 ?v10 ?v11) (pred_2 ?v13 ?v7)
                   (pred_6 ?v11 ?v7) (pred_3 ?v10) 
                   (pred_5 ?v11) (pred_10 ?v13))
:effect (and  (pred_11 ?v11) (not (pred_5 ?v11))))


(:action op_5
:parameters (?v10 ?v5)
:precondition (and (pred_1 ?v10) (pred_1 ?v5)
               (pred_3 ?v10) (pred_9 ?v10 ?v5) (pred_11 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v10))))

(:action op_3
:parameters (?v10 ?v13)
:precondition (and (pred_1 ?v10) (pred_8 ?v13) 
                  (pred_3 ?v10) (pred_4 ?v13 ?v10) (pred_7 ))
:effect (and (pred_10 ?v13)
   (not (pred_4 ?v13 ?v10)) (not (pred_7 ))))


(:action op_2
:parameters (?v10 ?v8 ?v12)
:precondition (and (pred_1 ?v10) (pred_8 ?v8) (pred_8 ?v12)
                  (pred_3 ?v10) (pred_10 ?v12) (pred_4 ?v8 ?v10))
:effect (and (pred_10 ?v8) (pred_4 ?v12 ?v10)
        (not (pred_10 ?v12)) (not (pred_4 ?v8 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_1 ?v10) (pred_8 ?v13) 
                  (pred_3 ?v10) (pred_10 ?v13))
:effect (and (pred_7 ) (pred_4 ?v13 ?v10) (not (pred_10 ?v13)))))


	
