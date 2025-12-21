(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_07 - type_1
obj_11 obj_03 obj_12 obj_04 - type_3
obj_02 obj_05 obj_01 - type_2
obj_06 obj_09 obj_08 - object)
(:init
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_11)
(pred_2 obj_10 obj_03)
(pred_4 obj_07 obj_01)
(pred_2 obj_07 obj_12)
(pred_2 obj_07 obj_04)
(pred_3 obj_06 obj_05)
(pred_3 obj_09 obj_02)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_01)
(pred_3 obj_09 obj_02)
(pred_3 obj_08 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_01) (pred_4 obj_07 obj_01))))
  )
)
)