; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1772433056 --problem-name spanner-s3-n3-l4-s1772433056
(define (problem spanner-s3-n3-l4-s1772433056)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_01 obj_03 obj_07 - type_4
     obj_09 obj_13 obj_11 - type_1
     obj_04 obj_10 obj_08 obj_02 - type_2
     obj_12 obj_06 - type_2
    )
 (:init 
    (pred_5 obj_05 obj_12)
    (pred_5 obj_01 obj_02)
    (pred_2 obj_01)
    (pred_5 obj_03 obj_02)
    (pred_2 obj_03)
    (pred_5 obj_07 obj_02)
    (pred_2 obj_07)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_06)
    (pred_4 obj_13)
    (pred_5 obj_13 obj_06)
    (pred_4 obj_11)
    (pred_5 obj_11 obj_06)
    (pred_1 obj_12 obj_04)
    (pred_1 obj_02 obj_06)
    (pred_1 obj_04 obj_10)
    (pred_1 obj_10 obj_08)
    (pred_1 obj_08 obj_02)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_13)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
