(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v5 ?v2)
             (pred_1 ?v4 ?v12)
             (pred_11 ?v5 ?v12)
             (pred_5 ?v1 ?v5 )
	     (pred_8 ?v5)
             (pred_4 ?v7)
             (pred_6 ?v4)
             (pred_9 ?v12)
             (pred_12 ?v5)
             (pred_7 ?v4)
             (pred_10 ?v5)
             (pred_3 ))



(:action op_4
:parameters (?v10 ?v13 ?v11 ?v8)
:precondition (and (pred_4 ?v10) (pred_4 ?v13) (pred_6 ?v11) (pred_9 ?v8)
          (pred_2 ?v10 ?v13) (pred_1 ?v11 ?v8)
                   (pred_11 ?v13 ?v8) (pred_8 ?v10) 
                   (pred_12 ?v13) (pred_7 ?v11))
:effect (and  (pred_10 ?v13) (not (pred_12 ?v13))))


(:action op_2
:parameters (?v10 ?v3)
:precondition (and (pred_4 ?v10) (pred_4 ?v3)
               (pred_8 ?v10) (pred_2 ?v10 ?v3) (pred_10 ?v3))
:effect (and (pred_8 ?v3) (not (pred_8 ?v10))))

(:action op_5
:parameters (?v10 ?v11)
:precondition (and (pred_4 ?v10) (pred_6 ?v11) 
                  (pred_8 ?v10) (pred_5 ?v11 ?v10) (pred_3 ))
:effect (and (pred_7 ?v11)
   (not (pred_5 ?v11 ?v10)) (not (pred_3 ))))


(:action op_3
:parameters (?v10 ?v9 ?v6)
:precondition (and (pred_4 ?v10) (pred_6 ?v9) (pred_6 ?v6)
                  (pred_8 ?v10) (pred_7 ?v6) (pred_5 ?v9 ?v10))
:effect (and (pred_7 ?v9) (pred_5 ?v6 ?v10)
        (not (pred_7 ?v6)) (not (pred_5 ?v9 ?v10))))

(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_4 ?v10) (pred_6 ?v11) 
                  (pred_8 ?v10) (pred_7 ?v11))
:effect (and (pred_3 ) (pred_5 ?v11 ?v10) (not (pred_7 ?v11)))))


	
