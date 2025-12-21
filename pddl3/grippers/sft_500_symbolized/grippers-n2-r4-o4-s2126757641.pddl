(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_06 obj_12 obj_10 obj_14 - type_2
obj_11 obj_07 obj_08 obj_03 - type_3
obj_01 obj_05 obj_09 obj_13 - object)
(:init
(pred_1 obj_04 obj_03)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_12)
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_10)
(pred_3 obj_02 obj_14)
(pred_2 obj_01 obj_11)
(pred_2 obj_05 obj_08)
(pred_2 obj_09 obj_07)
(pred_2 obj_13 obj_11)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_05 obj_03)
(pred_2 obj_09 obj_07)
(pred_2 obj_13 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_08) (pred_1 obj_02 obj_08))))
  )
)
)