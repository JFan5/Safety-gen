(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_10 - type_1
obj_07 obj_02 obj_06 obj_03 - type_2
obj_04 obj_09 obj_12 obj_01 - type_3
obj_08 obj_11 obj_13 - object)
(:init
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_02)
(pred_1 obj_10 obj_01)
(pred_3 obj_10 obj_06)
(pred_3 obj_10 obj_03)
(pred_2 obj_08 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_13 obj_09)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_11 obj_01)
(pred_2 obj_13 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_01) (pred_1 obj_10 obj_01))))
  )
)
)