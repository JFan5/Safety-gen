(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_11 obj_10 obj_02 obj_04 - type_3
obj_06 obj_03 obj_12 obj_01 - type_2
obj_08 obj_07 obj_09 - object)
(:init
(pred_3 obj_13 obj_01)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_10)
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_02)
(pred_4 obj_05 obj_04)
(pred_2 obj_08 obj_01)
(pred_2 obj_07 obj_12)
(pred_2 obj_09 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_07 obj_01)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_13 obj_01) (pred_3 obj_05 obj_01))))
  )
)
)