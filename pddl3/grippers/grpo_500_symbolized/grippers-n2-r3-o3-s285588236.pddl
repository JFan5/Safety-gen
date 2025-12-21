(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_07 obj_06 obj_08 obj_03 - type_3
obj_10 obj_04 obj_01 - type_2
obj_05 obj_09 obj_12 - object)
(:init
(pred_4 obj_11 obj_04)
(pred_2 obj_11 obj_07)
(pred_2 obj_11 obj_06)
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_03)
(pred_3 obj_05 obj_01)
(pred_3 obj_09 obj_10)
(pred_3 obj_12 obj_10)
)
(:goal
(and
(pred_3 obj_05 obj_01)
(pred_3 obj_09 obj_04)
(pred_3 obj_12 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_11 obj_04) (pred_4 obj_02 obj_04))))
  )
)
)