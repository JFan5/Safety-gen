(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_11 obj_09 obj_03 obj_08 - type_2
obj_01 obj_07 obj_06 - type_3
obj_05 obj_02 - object)
(:init
(pred_1 obj_10 obj_06)
(pred_3 obj_10 obj_11)
(pred_3 obj_10 obj_09)
(pred_1 obj_04 obj_06)
(pred_3 obj_04 obj_03)
(pred_3 obj_04 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_05 obj_06)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_01)))
)
)