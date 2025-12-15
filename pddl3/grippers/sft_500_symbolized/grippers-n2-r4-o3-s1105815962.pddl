(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_13 - type_1
obj_03 obj_02 obj_05 obj_04 - type_2
obj_11 obj_08 obj_09 obj_01 - type_3
obj_12 obj_06 obj_10 - object)
(:init
(pred_1 obj_07 obj_08)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_02)
(pred_1 obj_13 obj_09)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_04)
(pred_3 obj_12 obj_01)
(pred_3 obj_06 obj_09)
(pred_3 obj_10 obj_08)
)
(:goal
(and
(pred_3 obj_12 obj_09)
(pred_3 obj_06 obj_09)
(pred_3 obj_10 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_01) (pred_1 obj_13 obj_01))))
  )
)
)