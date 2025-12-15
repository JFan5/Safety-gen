(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_2
obj_10 obj_09 obj_01 obj_12 - type_3
obj_08 obj_13 obj_14 obj_07 - type_1
obj_06 obj_02 obj_11 obj_03 - object)
(:init
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_09)
(pred_3 obj_04 obj_07)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_12)
(pred_2 obj_06 obj_14)
(pred_2 obj_02 obj_14)
(pred_2 obj_11 obj_08)
(pred_2 obj_03 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_13)
(pred_2 obj_02 obj_07)
(pred_2 obj_11 obj_13)
(pred_2 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_13) (pred_3 obj_04 obj_13))))
  )
)
)