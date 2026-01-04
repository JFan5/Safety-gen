(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_3
obj_14 obj_02 obj_01 obj_03 - type_1
obj_13 obj_08 obj_05 obj_11 - type_2
obj_06 obj_07 obj_12 obj_09 - object)
(:init
(pred_1 obj_04 obj_11)
(pred_2 obj_04 obj_14)
(pred_2 obj_04 obj_02)
(pred_1 obj_10 obj_05)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_03)
(pred_4 obj_06 obj_08)
(pred_4 obj_07 obj_05)
(pred_4 obj_12 obj_08)
(pred_4 obj_09 obj_13)
)
(:goal
(and
(pred_4 obj_06 obj_05)
(pred_4 obj_07 obj_13)
(pred_4 obj_12 obj_05)
(pred_4 obj_09 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_08) (pred_1 obj_10 obj_08))))
    (always (not (and (pred_1 obj_04 obj_05) (pred_1 obj_10 obj_05))))
  )
)
)