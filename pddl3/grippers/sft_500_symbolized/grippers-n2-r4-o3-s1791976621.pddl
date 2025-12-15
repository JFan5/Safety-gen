(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_13 - type_1
obj_02 obj_07 obj_12 obj_05 - type_3
obj_04 obj_09 obj_01 obj_03 - type_2
obj_06 obj_11 obj_08 - object)
(:init
(pred_2 obj_10 obj_01)
(pred_1 obj_10 obj_02)
(pred_1 obj_10 obj_07)
(pred_2 obj_13 obj_09)
(pred_1 obj_13 obj_12)
(pred_1 obj_13 obj_05)
(pred_3 obj_06 obj_09)
(pred_3 obj_11 obj_01)
(pred_3 obj_08 obj_09)
)
(:goal
(and
(pred_3 obj_06 obj_01)
(pred_3 obj_11 obj_04)
(pred_3 obj_08 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_01) (pred_2 obj_13 obj_01))))
  )
)
)