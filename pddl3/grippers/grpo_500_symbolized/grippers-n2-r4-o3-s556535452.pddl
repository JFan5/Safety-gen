(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_12 obj_08 obj_11 obj_01 - type_3
obj_13 obj_07 obj_04 obj_02 - type_2
obj_10 obj_03 obj_09 - object)
(:init
(pred_4 obj_06 obj_04)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_08)
(pred_4 obj_05 obj_07)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_01)
(pred_3 obj_10 obj_13)
(pred_3 obj_03 obj_07)
(pred_3 obj_09 obj_02)
)
(:goal
(and
(pred_3 obj_10 obj_02)
(pred_3 obj_03 obj_13)
(pred_3 obj_09 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_13) (pred_4 obj_05 obj_13))))
    (always (not (and (pred_4 obj_06 obj_02) (pred_4 obj_05 obj_02))))
  )
)
)