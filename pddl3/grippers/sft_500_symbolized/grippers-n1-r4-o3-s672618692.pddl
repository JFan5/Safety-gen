(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_02 obj_05 - type_3
obj_03 obj_07 obj_08 obj_10 - type_1
obj_01 obj_09 obj_04 - object)
(:init
(pred_3 obj_06 obj_07)
(pred_4 obj_06 obj_02)
(pred_4 obj_06 obj_05)
(pred_2 obj_01 obj_07)
(pred_2 obj_09 obj_03)
(pred_2 obj_04 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_09 obj_03)
(pred_2 obj_04 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_02))))
)
)