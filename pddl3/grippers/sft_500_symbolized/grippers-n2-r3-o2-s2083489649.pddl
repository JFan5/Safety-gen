(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_1
obj_10 obj_05 obj_11 obj_07 - type_3
obj_08 obj_04 obj_03 - type_2
obj_06 obj_09 - object)
(:init
(pred_3 obj_01 obj_04)
(pred_1 obj_01 obj_10)
(pred_1 obj_01 obj_05)
(pred_3 obj_02 obj_08)
(pred_1 obj_02 obj_11)
(pred_1 obj_02 obj_07)
(pred_4 obj_06 obj_08)
(pred_4 obj_09 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_04)
(pred_4 obj_09 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_04) (pred_3 obj_02 obj_04))))
  )
)
)