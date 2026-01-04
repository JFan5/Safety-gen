; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 81250591 --problem-name spanner-s4-n3-l4-s81250591
(define (problem spanner-s4-n3-l4-s81250591)
 (:domain spanner)
 (:objects 
     obj_12 - type_1
     obj_13 obj_03 obj_11 obj_05 - type_2
     obj_01 obj_04 obj_14 - type_5
     obj_08 obj_09 obj_02 obj_07 - type_4
     obj_10 obj_06 - type_4
    )
 (:init 
    (pred_3 obj_12 obj_10)
    (pred_3 obj_13 obj_09)
    (pred_6 obj_13)
    (pred_3 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_3 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_3 obj_05 obj_02)
    (pred_6 obj_05)
    (pred_2 obj_01)
    (pred_3 obj_01 obj_06)
    (pred_2 obj_04)
    (pred_3 obj_04 obj_06)
    (pred_2 obj_14)
    (pred_3 obj_14 obj_06)
    (pred_1 obj_10 obj_08)
    (pred_1 obj_07 obj_06)
    (pred_1 obj_08 obj_09)
    (pred_1 obj_09 obj_02)
    (pred_1 obj_02 obj_07)
)
 (:goal
  (and
   (pred_4 obj_01)
   (pred_4 obj_04)
   (pred_4 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
