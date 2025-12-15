(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v8)
             (pred_11 ?v7 ?v6)
             (pred_9 ?v9 ?v6)
             (pred_4 ?v10 ?v9 )
	     (pred_1 ?v9)
             (pred_3 ?v5)
             (pred_2 ?v7)
             (pred_6 ?v6)
             (pred_12 ?v9)
             (pred_8 ?v7)
             (pred_5 ?v9)
             (pred_7 ))



(:action op_2
:parameters (?v12 ?v11 ?v1 ?v13)
:precondition (and (pred_3 ?v12) (pred_3 ?v11) (pred_2 ?v1) (pred_6 ?v13)
          (pred_10 ?v12 ?v11) (pred_11 ?v1 ?v13)
                   (pred_9 ?v11 ?v13) (pred_1 ?v12) 
                   (pred_12 ?v11) (pred_8 ?v1))
:effect (and  (pred_5 ?v11) (not (pred_12 ?v11))))


(:action op_3
:parameters (?v12 ?v4)
:precondition (and (pred_3 ?v12) (pred_3 ?v4)
               (pred_1 ?v12) (pred_10 ?v12 ?v4) (pred_5 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_3 ?v12) (pred_2 ?v1) 
                  (pred_1 ?v12) (pred_4 ?v1 ?v12) (pred_7 ))
:effect (and (pred_8 ?v1)
   (not (pred_4 ?v1 ?v12)) (not (pred_7 ))))


(:action op_1
:parameters (?v12 ?v3 ?v2)
:precondition (and (pred_3 ?v12) (pred_2 ?v3) (pred_2 ?v2)
                  (pred_1 ?v12) (pred_8 ?v2) (pred_4 ?v3 ?v12))
:effect (and (pred_8 ?v3) (pred_4 ?v2 ?v12)
        (not (pred_8 ?v2)) (not (pred_4 ?v3 ?v12))))

(:action op_4
:parameters (?v12 ?v1)
:precondition (and (pred_3 ?v12) (pred_2 ?v1) 
                  (pred_1 ?v12) (pred_8 ?v1))
:effect (and (pred_7 ) (pred_4 ?v1 ?v12) (not (pred_8 ?v1)))))


	
