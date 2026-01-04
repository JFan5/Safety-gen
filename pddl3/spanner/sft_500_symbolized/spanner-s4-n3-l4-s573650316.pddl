; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 573650316 --problem-name spanner-s4-n3-l4-s573650316
(define (problem spanner-s4-n3-l4-s573650316)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_03 obj_07 obj_11 obj_13 - type_1
     obj_02 obj_04 obj_10 - type_5
     obj_06 obj_05 obj_08 obj_01 - type_3
     obj_12 obj_14 - type_3
    )
 (:init 
    (pred_1 obj_09 obj_12)
    (pred_1 obj_03 obj_06)
    (pred_6 obj_03)
    (pred_1 obj_07 obj_01)
    (pred_6 obj_07)
    (pred_1 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_1 obj_13 obj_06)
    (pred_6 obj_13)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_14)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_14)
    (pred_5 obj_10)
    (pred_1 obj_10 obj_14)
    (pred_2 obj_12 obj_06)
    (pred_2 obj_01 obj_14)
    (pred_2 obj_06 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_08 obj_01)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_04)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
