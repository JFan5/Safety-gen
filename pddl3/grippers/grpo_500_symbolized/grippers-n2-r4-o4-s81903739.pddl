(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_10 obj_13 obj_01 obj_07 - type_3
obj_12 obj_05 obj_04 obj_08 - type_2
obj_06 obj_09 obj_03 obj_14 - object)
(:init
(pred_3 obj_11 obj_08)
(pred_4 obj_11 obj_10)
(pred_4 obj_11 obj_13)
(pred_3 obj_02 obj_04)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_07)
(pred_2 obj_06 obj_05)
(pred_2 obj_09 obj_04)
(pred_2 obj_03 obj_08)
(pred_2 obj_14 obj_05)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_09 obj_08)
(pred_2 obj_03 obj_12)
(pred_2 obj_14 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_05) (pred_3 obj_02 obj_05))))
    (always (not (and (pred_3 obj_11 obj_08) (pred_3 obj_02 obj_08))))
  )
)
)