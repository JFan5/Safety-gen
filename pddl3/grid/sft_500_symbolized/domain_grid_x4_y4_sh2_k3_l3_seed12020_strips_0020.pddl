(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v1)
             (pred_4 ?v6 ?v7)
             (pred_10 ?v2 ?v7)
             (pred_8 ?v12 ?v2 )
	     (pred_3 ?v2)
             (pred_2 ?v5)
             (pred_9 ?v6)
             (pred_12 ?v7)
             (pred_6 ?v2)
             (pred_1 ?v6)
             (pred_11 ?v2)
             (pred_5 ))



(:action op_3
:parameters (?v10 ?v11 ?v4 ?v3)
:precondition (and (pred_2 ?v10) (pred_2 ?v11) (pred_9 ?v4) (pred_12 ?v3)
          (pred_7 ?v10 ?v11) (pred_4 ?v4 ?v3)
                   (pred_10 ?v11 ?v3) (pred_3 ?v10) 
                   (pred_6 ?v11) (pred_1 ?v4))
:effect (and  (pred_11 ?v11) (not (pred_6 ?v11))))


(:action op_5
:parameters (?v10 ?v13)
:precondition (and (pred_2 ?v10) (pred_2 ?v13)
               (pred_3 ?v10) (pred_7 ?v10 ?v13) (pred_11 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v10))))

(:action op_4
:parameters (?v10 ?v4)
:precondition (and (pred_2 ?v10) (pred_9 ?v4) 
                  (pred_3 ?v10) (pred_8 ?v4 ?v10) (pred_5 ))
:effect (and (pred_1 ?v4)
   (not (pred_8 ?v4 ?v10)) (not (pred_5 ))))


(:action op_2
:parameters (?v10 ?v9 ?v8)
:precondition (and (pred_2 ?v10) (pred_9 ?v9) (pred_9 ?v8)
                  (pred_3 ?v10) (pred_1 ?v8) (pred_8 ?v9 ?v10))
:effect (and (pred_1 ?v9) (pred_8 ?v8 ?v10)
        (not (pred_1 ?v8)) (not (pred_8 ?v9 ?v10))))

(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_2 ?v10) (pred_9 ?v4) 
                  (pred_3 ?v10) (pred_1 ?v4))
:effect (and (pred_5 ) (pred_8 ?v4 ?v10) (not (pred_1 ?v4)))))


	
