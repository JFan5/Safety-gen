(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_08 obj_02 obj_07 obj_04 - type_3
obj_06 obj_13 obj_11 obj_03 - type_2
obj_14 obj_05 obj_12 obj_01 - object)
(:init
(pred_3 obj_10 obj_11)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_02)
(pred_3 obj_09 obj_13)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_04)
(pred_2 obj_14 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_12 obj_11)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_14 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_12 obj_13)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_13) (pred_3 obj_09 obj_13))))
  )
)
)