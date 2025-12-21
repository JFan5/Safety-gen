(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_06 obj_02 obj_01 obj_12 - type_2
obj_11 obj_04 obj_13 obj_08 - type_3
obj_10 obj_07 obj_05 - object)
(:init
(pred_1 obj_09 obj_13)
(pred_3 obj_09 obj_06)
(pred_3 obj_09 obj_02)
(pred_1 obj_03 obj_08)
(pred_3 obj_03 obj_01)
(pred_3 obj_03 obj_12)
(pred_2 obj_10 obj_13)
(pred_2 obj_07 obj_04)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_10 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_05 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_13) (pred_1 obj_03 obj_13))))
  )
)
)