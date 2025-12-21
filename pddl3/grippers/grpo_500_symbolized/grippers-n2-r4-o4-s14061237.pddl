(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_08 - type_1
obj_12 obj_10 obj_05 obj_02 - type_3
obj_04 obj_11 obj_14 obj_01 - type_2
obj_07 obj_13 obj_06 obj_03 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_2 obj_09 obj_12)
(pred_2 obj_09 obj_10)
(pred_4 obj_08 obj_14)
(pred_2 obj_08 obj_05)
(pred_2 obj_08 obj_02)
(pred_3 obj_07 obj_04)
(pred_3 obj_13 obj_11)
(pred_3 obj_06 obj_04)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_13 obj_04)
(pred_3 obj_06 obj_11)
(pred_3 obj_03 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_11) (pred_4 obj_08 obj_11))))
    (always (not (and (pred_4 obj_09 obj_01) (pred_4 obj_08 obj_01))))
  )
)
)