(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_02 obj_10 obj_09 obj_05 - type_3
obj_13 obj_01 obj_11 obj_08 - type_2
obj_04 obj_07 obj_12 - object)
(:init
(pred_4 obj_03 obj_08)
(pred_2 obj_03 obj_02)
(pred_2 obj_03 obj_10)
(pred_4 obj_06 obj_13)
(pred_2 obj_06 obj_09)
(pred_2 obj_06 obj_05)
(pred_3 obj_04 obj_08)
(pred_3 obj_07 obj_01)
(pred_3 obj_12 obj_01)
)
(:goal
(and
(pred_3 obj_04 obj_08)
(pred_3 obj_07 obj_13)
(pred_3 obj_12 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_01) (pred_4 obj_06 obj_01))))
  )
)
)