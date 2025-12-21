(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_01 obj_09 obj_08 obj_10 - type_3
obj_07 obj_03 obj_05 - type_2
obj_02 obj_04 - object)
(:init
(pred_4 obj_11 obj_07)
(pred_2 obj_11 obj_01)
(pred_2 obj_11 obj_09)
(pred_4 obj_06 obj_03)
(pred_2 obj_06 obj_08)
(pred_2 obj_06 obj_10)
(pred_3 obj_02 obj_03)
(pred_3 obj_04 obj_05)
)
(:goal
(and
(pred_3 obj_02 obj_07)
(pred_3 obj_04 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_05)))
)
)