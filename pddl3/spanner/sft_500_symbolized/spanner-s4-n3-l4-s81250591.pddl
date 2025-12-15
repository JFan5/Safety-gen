; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 81250591 --problem-name spanner-s4-n3-l4-s81250591
(define (problem spanner-s4-n3-l4-s81250591)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_10 obj_12 obj_07 obj_09 - type_4
     obj_14 obj_02 obj_03 - type_2
     obj_05 obj_13 obj_08 obj_01 - type_3
     obj_11 obj_06 - type_3
    )
 (:init 
    (pred_5 obj_04 obj_11)
    (pred_5 obj_10 obj_13)
    (pred_3 obj_10)
    (pred_5 obj_12 obj_08)
    (pred_3 obj_12)
    (pred_5 obj_07 obj_05)
    (pred_3 obj_07)
    (pred_5 obj_09 obj_08)
    (pred_3 obj_09)
    (pred_2 obj_14)
    (pred_5 obj_14 obj_06)
    (pred_2 obj_02)
    (pred_5 obj_02 obj_06)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_06)
    (pred_4 obj_11 obj_05)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_05 obj_13)
    (pred_4 obj_13 obj_08)
    (pred_4 obj_08 obj_01)
)
 (:goal
  (and
   (pred_1 obj_14)
   (pred_1 obj_02)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_14)) (not (pred_1 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
