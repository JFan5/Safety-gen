; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 728535634 --problem-name spanner-s4-n3-l4-s728535634
(define (problem spanner-s4-n3-l4-s728535634)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_04 obj_12 obj_06 obj_13 - type_3
     obj_02 obj_01 obj_11 - type_1
     obj_14 obj_05 obj_07 obj_03 - type_5
     obj_09 obj_08 - type_5
    )
 (:init 
    (pred_4 obj_10 obj_09)
    (pred_4 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_4 obj_12 obj_05)
    (pred_1 obj_12)
    (pred_4 obj_06 obj_05)
    (pred_1 obj_06)
    (pred_4 obj_13 obj_05)
    (pred_1 obj_13)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_08)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_08)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_08)
    (pred_3 obj_09 obj_14)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_14 obj_05)
    (pred_3 obj_05 obj_07)
    (pred_3 obj_07 obj_03)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_01)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
