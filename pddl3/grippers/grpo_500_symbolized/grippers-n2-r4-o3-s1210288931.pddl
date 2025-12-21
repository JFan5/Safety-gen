(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_1
obj_09 obj_13 obj_11 obj_08 - type_3
obj_03 obj_02 obj_04 obj_01 - type_2
obj_10 obj_06 obj_07 - object)
(:init
(pred_4 obj_05 obj_02)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_13)
(pred_4 obj_12 obj_01)
(pred_2 obj_12 obj_11)
(pred_2 obj_12 obj_08)
(pred_3 obj_10 obj_02)
(pred_3 obj_06 obj_03)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_04)
(pred_3 obj_06 obj_01)
(pred_3 obj_07 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_01) (pred_4 obj_12 obj_01))))
  )
)
)